<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceapi_focus_day_period extends SectionDatasource {

		public $dsParamROOTELEMENT = 'api-focus-day-period';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'dates';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'223' => '{$date} -3 days 00:00 to {$date} + 3 days 23:59',
				'224' => '{$cookie-username}, {$ds-auth-token.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'dates'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-auth-token.user');
		}

		public function about() {
			return array(
				'name' => 'API: Focus Day: Period',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-29T19:55:25+00:00'
			);
		}

		public function getSource() {
			return '15';
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
