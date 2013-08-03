<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceexport_ailments extends SectionDatasource {

		public $dsParamROOTELEMENT = 'export-ailments';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'no';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:creation-date';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'28' => '{$cookie-username}, {$ds-auth-token.user}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'time',
				'author',
				'period',
				'type',
				'headache-type',
				'neuro',
				'Illness',
				'body-parts',
				'ailment',
				'impact',
				'intensity',
				'triggers: formatted',
				'triggers: unformatted',
				'comment: formatted',
				'comment: unformatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-auth-token.user');
		}

		public function about() {
			return array(
				'name' => 'Export Ailments',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-27T03:53:23+00:00'
			);
		}

		public function getSource() {
			return '1';
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
