<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcehome_this_week_activity extends SectionDatasource {

		public $dsParamROOTELEMENT = 'home-this-week-activity';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'day';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'32' => 'later than 6 days ago 00:00',
				'43' => '{$cookie-username}, {$ds-auth-token.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'day',
				'type',
				'work-time',
				'sick-day',
				'morning-wakefulness',
				'morning-mental-state',
				'morning-stress',
				'morning-body-state',
				'morning-wellness',
				'afternoon-wakefulness',
				'afternoon-body-state',
				'afternoon-mental-state',
				'afternoon-stress',
				'afternoon-wellness',
				'evening-wakefulness',
				'evening-body-state',
				'evening-wellness',
				'evening-stress',
				'evening-mental-state'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-auth-token.user');
		}

		public function about() {
			return array(
				'name' => 'Home: This Week: Activity',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-29T13:48:04+00:00'
			);
		}

		public function getSource() {
			return '6';
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
