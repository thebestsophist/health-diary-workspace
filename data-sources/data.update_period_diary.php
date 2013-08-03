<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceupdate_period_diary extends SectionDatasource {

		public $dsParamROOTELEMENT = 'update-period-diary';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'223' => 'end: 9876-05-04T03:21',
				'224' => '{$cookie-username}, {$ds-current-user.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'dates',
				'type',
				'comment: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-current-user.user');
		}

		public function about() {
			return array(
				'name' => 'Update Period Diary',
				'author' => array(
					'name' => 'Test McTestipants',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'hello@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-27T01:18:19+00:00'
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
