<%@ page import="diseaseDiscovery.domain.com.Symptom" %>

<!DOCTYPE html>
<head>
	<meta name="layout" content="main">
	<title>Disease Discovery</title>
	
	<g:javascript>
		$(document).ready(function() {
			$('.combobox').combobox();
		
			setup(
					"${createLink(controller: 'Symptom', action: 'getSymptoms')}",
				  	"${createLink(controller: 'Main', action: 'makePrediction')}",
				  	"${createLink(controller: 'Main', action: 'getFiles')}",
				  	"${createLink(controller: 'Main', action: 'getDiseasesByLetter')}",
				  	"${createLink(controller: 'Main', action: 'getSymptomsByLetter')}",
				  	"${createLink(controller: 'Main', action: 'getComponents')}"
				  );
			removeDisabledLinks();
		});
	</g:javascript>
</head>
<body>

	<div id="alert"></div>
	<div class="tabs">
		<ul id="main-tabs" class="nav nav-tabs">
			<li class="active"><a href="#main-tab" data-toggle="tab">Prediction</a></li>
			<li style="float: right"><a href="#sympt-tab" data-toggle="tab">Symptom List</a></li>
			<li style="float: right"><a href="#disease-tab" data-toggle="tab">Disease List</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="main-tab">
				<div class="panel panel-primary">
					<div class="panel-heading">
			 		 	
			 		 	<div class="row">
			 		 		<h3 class="panel-title col-lg-5">Symptoms List</h3>
<%--			 		 		<select id="autocomplete_match" class="autocomplete-option col-lg-2">--%>
<%--			 		 			<option value="contains">containing</option>--%>
<%--			 		 			<option value="begins_by">beginning with</option>--%>
<%--			 		 		</select>--%>
							<div class="col-lg-7">
<%--						 		 	<input type="text" class="form-control" name="symptom" id="symptom_name" --%>
<%--							  			   value="" placeholder="Enter symptom..." />--%>
<%--						  			<input type="hidden" id="symptom_id" name="symptom_id" value="" />--%>
								<div class="col-lg-9">
									<select id='sympts' class='combobox form-control heh'>
										<option></option>
										<g:each in="${Symptom.list()}">
											<option value='${it.id}'>${it.name}</option>
										</g:each>
									</select>
								</div>
								<div class="col-lg-3">
						      		<div class="input-group-btn">
						        		<button class="btn btn-default" id="btn_addSymptom"	
						        				type="button">
						        			Add symptom
						        		</button>
						      		</div>
						      	</div>
							</div>
						</div>
					</div>
					<form id="elementList">
						<ul id="elements" class="list-group padded"></ul>
					</form>
			
			    	<div class="panel-footer">
			    		<div class="row">
			    			<div class="col-md-9">
								
							</div>
							<div class="col-md-2">
								<button class="btn btn-default" id="btn_submitSymptoms"	type="button">
					       			Submit Symptoms
					       		</button>
					       	</div>
						</div>
			    	</div>
			    	
				</div>
			</div>
			<div class="tab-pane" id="sympt-tab">
				<ul id="letter-tabs" class="nav nav-pills nav-stacked">
					<g:each in="${'A'..'Z'}">
  						<li class="${it in symptomLetters ? it == symptomLetters[0] ? '':'':'disabled'}"><a href="#s_${it}" data-toggle="tab">${it}</a></li>
  					</g:each>
				</ul>
				<div class="tab-content">
					<g:each in="${'A'..'Z'}">
						<g:if test="${it in symptomLetters}">
							<div class="padded tab-pane fade ${it == symptomLetters[0] ? 'in active':''}" id="s_${it}"><br/></div>
						</g:if>
					</g:each>
				</div>
			</div>
			<div class="tab-pane" id="disease-tab">
				<ul id="letter-tabs" class="nav nav-pills nav-stacked">
					<li class="disabled" style="display:none"><a href="#d__1" data-toggle="tab"></a></li>
					<g:each in="${'A'..'Z'}">
  						<li class="${it in diseaseLetters ? it == diseaseLetters[0] ? '':'':'disabled'}"><a href="#d_${it}" data-toggle="tab">${it}</a></li>
  					</g:each>
				</ul>
				<div class="tab-content">
					<g:each in="${'A'..'Z'}">
						<g:if test="${it in diseaseLetters}">
							<div class="padded tab-pane fade ${it == symptomLetters[0] ? 'in active':''}" id="d_${it}"><br/></div>
						</g:if>
					</g:each>
				</div>
			</div>
		</div>
	</div>
	
	<div class="panel panel-primary">
		<div class="panel-heading">
			<div class="row">
				<div class="col-md-4">
	 		 		<h3 id="prediction_title" class="panel-title">
	 		 			Predicted Disease
	 		 		</h3>
	 		 		<img id="loading" style="display:none;" src="${resource(dir: 'images', file: 'ajax-loader.gif')}" alt="Loading..."/>
	 		 	</div>
	 		 	<h4 class="col-md-offset-3 col-md-4">
	 		 		<div id="disease"></div>
	 		 	</h4>
	 		 	<h4 class="col-md-1"><div id="warning-icon" data-toggle="tooltip" data-placement="top" title="This prediction has a very low score. The probability of this disease being a rare disease is under 0.0001%. Please check the symptom list."></div></h4>
	 		</div>
		</div>
		<div id="prediction_dropdown" class="panel-collapse collapse padded">
		</div>
	</div>
</body>

