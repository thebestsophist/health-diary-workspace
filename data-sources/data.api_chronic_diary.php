<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceapi_chronic_diary extends SectionDatasource {

		public $dsParamROOTELEMENT = 'api-chronic-diary';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'134' => '{$start: 1 month ago} to {$end: $today}',
				'135' => '{$cookie-username}, {$ds-auth-token.user}',
		);
		

		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-auth-token.user');
		}

		public function about() {
			return array(
				'name' => 'API: Chronic Diary',
				'author' => array(
					'name' => 'Test McTestipants',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'hello@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-25T20:46:22+00:00'
			);
		}

		public function getSource() {
			return '14';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
