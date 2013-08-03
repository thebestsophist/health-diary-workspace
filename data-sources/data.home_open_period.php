<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcehome_open_period extends SectionDatasource {

		public $dsParamROOTELEMENT = 'home-open-period';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'system:id'
		);
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'223' => 'end: 9876-05-04T03:21',
				'224' => '{$ds-current-user.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-current-user.user');
		}

		public function about() {
			return array(
				'name' => 'Home: Open Period',
				'author' => array(
					'name' => 'Test McTestipants',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'hello@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-27T00:43:08+00:00'
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
