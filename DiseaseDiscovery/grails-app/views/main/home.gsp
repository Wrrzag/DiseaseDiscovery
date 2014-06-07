<!DOCTYPE html>
<head>
	<meta name="layout" content="main">
	<title>Disease Discovery</title>
	
	<g:javascript src="symptomList.js"/>
	<g:javascript>
		$(document).ready(function() {
			setup(
					"${createLink(controller: 'Symptom', action: 'getSymptoms')}",
				  	"${createLink(controller: 'SymptomDisease', action: 'makePrediction')}",
				  	"${createLink(controller: 'SymptomDisease', action: 'getFiles')}"
				  );
			removeDisabledLinks();
		});
	</g:javascript>
</head>
<body>

	<div class="tabs">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#main-tab" data-toggle="tab">Main</a></li>
			<li style="float: right"><a href="#sympt-tab" data-toggle="tab">Symptom List</a></li>
			<li style="float: right"><a href="#disease-tab" data-toggle="tab">Disease List</a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="main-tab">
				<div class="panel panel-primary">
					<div class="panel-heading">
			 		 	
			 		 	<div class="row">
			 		 		<h3 class="panel-title col-lg-6">Symptoms List</h3>
							<div class="col-lg-6">
						    	<div class="input-group">
						 		 	<input type="text" class="form-control" name="symptom" id="symptom_name" 
							  			   value="" placeholder="Enter symptom..." />
						  			<input type="hidden" id="symptom_id" name="symptom_id" value="" />
						      		<span class="input-group-btn">
						        		<button class="btn btn-default" id="btn_addSymptom"	
						        				type="button">
						        			Add symptom
						        		</button>
						      		</span>
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
								<h4 class="panel-title">
							        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
							          Advanced
							        </a>
								</h4>
							</div>
							<div class="col-md-2">
								<button class="btn btn-default" id="btn_submitSymptoms"	type="button">
					       			Submit Symptoms
					       		</button>
					       	</div>
						</div>
			    	</div>
			    	<div id="collapseOne" class="panel-collapse collapse ">
						<div id="modelList" class="panel-body">
							<ul id="sliders"></ul>
							<button class="btn btn-default" id="btn_defaultWeights"	type="button">
					       		Default weights
					       	</button>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="sympt-tab">
				<ul class="nav nav-pills nav-stacked">
					<g:each in="${'A'..'Z'}">
  						<li class="${it in symptomLetters ? it == symptomLetters[0] ? 'active':'':'disabled'}"><a href="#sympt_${it}" data-toggle="tab">${it}</a></li>
  					</g:each>
				</ul>
				<div class="tab-content">
					<g:each in="${'A'..'Z'}">
						<g:if test="${it in symptomLetters}">
							<div class="tab-pane fade ${it == symptomLetters[0] ? 'in active':''}" id="sympt_${it}">
								AQUI HI HA ${it}
							</div>
						</g:if>
					</g:each>
				</div>
			</div>
			<div class="tab-pane" id="disease-tab">
				<ul class="nav nav-pills nav-stacked">
					<g:each in="${'A'..'Z'}">
  						<li class="${it in diseaseLetters ? it == diseaseLetters[0] ? 'active':'':'disabled'}"><a href="#dis_${it}" data-toggle="tab">${it}</a></li>
  					</g:each>
				</ul>
				<div class="tab-content">
					<g:each in="${'A'..'Z'}">
						<g:if test="${it in diseaseLetters}">
							<div class="tab-pane fade ${it == symptomLetters[0] ? 'in active':''}" id="dis_${it}">
								AQUI HI HA ${it}
							</div>
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
	 		 		<h3 class="panel-title">Predicted Disease</h3>
	 		 	</div>
	 		 	<h4 class="col-md-offset-4 col-md-4">
	 		 		<div id="disease"></div>
	 		 	</h4>
	 		</div>
		</div>
	</div>
</body>
