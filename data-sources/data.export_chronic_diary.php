<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceexport_chronic_diary extends SectionDatasource {

		public $dsParamROOTELEMENT = 'export-chronic-diary';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:creation-date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'135' => '{$cookie-username}, {$ds-auth-token.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'date',
				'author',
				'morning-concentration',
				'morning-strength',
				'morning-motor-control',
				'morning-tremors',
				'morning-pain',
				'morning-breath',
				'morning-temperature',
				'morning-aches',
				'morning-allergies',
				'morning-head',
				'morning-chest',
				'morning-upper-right',
				'morning-upper-left',
				'morning-lower-right',
				'morning-lower-left',
				'afternoon-concentration',
				'afternoon-strength',
				'afternoon-motor-control',
				'afternoon-tremors',
				'afternoon-pain',
				'afternoon-breath',
				'afternoon-temperature',
				'afternoon-aches',
				'afternoon-allergies',
				'afternoon-head',
				'afternoon-chest',
				'afternoon-upper-right',
				'afternoon-upper-left',
				'afternoon-lower-left',
				'afternoon-lower-right',
				'evening-concentration',
				'evening-strength',
				'evening-motor-control',
				'evening-tremors',
				'evening-pain',
				'evening-breath',
				'evening-temperature',
				'evening-aches',
				'evening-allergies',
				'evening-head',
				'evening-chest',
				'evening-upper-right',
				'evening-upper-left',
				'evening-lower-right',
				'evening-lower-left',
				'wake-concentration',
				'wake-strength',
				'wake-motor-control',
				'wake-tremors',
				'wake-pain',
				'wake-breath',
				'wake-temperature',
				'wake-aches',
				'wake-allergies',
				'wake-head',
				'wake-chest',
				'wake-upper-right',
				'wake-upper-left',
				'wake-lower-right',
				'wake-lower-left',
				'sleep-concentration',
				'sleep-strength',
				'sleep-motor-control',
				'sleep-tremors',
				'sleep-pain',
				'sleep-breath',
				'sleep-temperature',
				'sleep-aches',
				'sleep-allergies',
				'sleep-head',
				'sleep-chest',
				'sleep-upper-right',
				'sleep-upper-left',
				'sleep-lower-right',
				'sleep-lower-left'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-auth-token.user');
		}

		public function about() {
			return array(
				'name' => 'Export Chronic Diary',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-27T03:54:29+00:00'
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
