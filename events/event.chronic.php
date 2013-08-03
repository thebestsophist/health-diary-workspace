<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventchronic extends SectionEvent{

		public $ROOTELEMENT = 'chronic';

		public $eParamFILTERS = array(
			'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'Chronic',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-26T15:36:01+00:00',
				'trigger-condition' => 'action[chronic]'
			);
		}

		public static function getSource(){
			return '14';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;chronic result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/chronic></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;chronic result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/chronic></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;chronic result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/chronic></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
  &lt;label>Metadata
    &lt;input name="fields[metadata-tab]" type="text" />
  &lt;/label>
  &lt;label>Date
    &lt;input name="fields[date][start][]" type="text" />
    &lt;input name="fields[date][end][]" type="text" />
  &lt;/label>
  &lt;label>Author
    &lt;select name="fields[author]">
      &lt;option value="1">Bernard Yu&lt;/option>
      &lt;option value="2">Jeni Gudgeon&lt;/option>
      &lt;option value="3">Test McTestipants&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Morning Tab
    &lt;input name="fields[morning-tab]" type="text" />
  &lt;/label>
  &lt;label>Morning Concentration
    &lt;input name="fields[morning-concentration]" type="text" />
  &lt;/label>
  &lt;label>Morning Strength
    &lt;input name="fields[morning-strength]" type="text" />
  &lt;/label>
  &lt;label>Morning  Motor Control
    &lt;input name="fields[morning-motor-control]" type="text" />
  &lt;/label>
  &lt;label>Morning  Tremors
    &lt;input name="fields[morning-tremors]" type="text" />
  &lt;/label>
  &lt;label>Morning Pain
    &lt;input name="fields[morning-pain]" type="text" />
  &lt;/label>
  &lt;label>Morning Breath
    &lt;input name="fields[morning-breath]" type="text" />
  &lt;/label>
  &lt;label>Morning Temperature
    &lt;input name="fields[morning-temperature]" type="text" />
  &lt;/label>
  &lt;label>Morning  Aches
    &lt;input name="fields[morning-aches]" type="text" />
  &lt;/label>
  &lt;label>Morning Allergies
    &lt;input name="fields[morning-allergies]" type="text" />
  &lt;/label>
  &lt;label>Morning Head and Neck
    &lt;input name="fields[morning-head]" type="text" />
  &lt;/label>
  &lt;label>Morning Chest
    &lt;input name="fields[morning-chest]" type="text" />
  &lt;/label>
  &lt;label>Morning Upper Right
    &lt;input name="fields[morning-upper-right]" type="text" />
  &lt;/label>
  &lt;label>Morning Upper Left
    &lt;input name="fields[morning-upper-left]" type="text" />
  &lt;/label>
  &lt;label>Morning Lower Right
    &lt;input name="fields[morning-lower-right]" type="text" />
  &lt;/label>
  &lt;label>Morning Lower Left
    &lt;input name="fields[morning-lower-left]" type="text" />
  &lt;/label>
  &lt;label>Afternoon
    &lt;input name="fields[afternoon-tab]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Concentration
    &lt;input name="fields[afternoon-concentration]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Strength
    &lt;input name="fields[afternoon-strength]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Motor Control
    &lt;input name="fields[afternoon-motor-control]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Tremors
    &lt;input name="fields[afternoon-tremors]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Pain
    &lt;input name="fields[afternoon-pain]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Breath
    &lt;input name="fields[afternoon-breath]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Temperature
    &lt;input name="fields[afternoon-temperature]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Aches
    &lt;input name="fields[afternoon-aches]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Allergies
    &lt;input name="fields[afternoon-allergies]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Head and Neck
    &lt;input name="fields[afternoon-head]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Chest
    &lt;input name="fields[afternoon-chest]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Upper Right
    &lt;input name="fields[afternoon-upper-right]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Upper Left
    &lt;input name="fields[afternoon-upper-left]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Lower Left
    &lt;input name="fields[afternoon-lower-left]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Lower RIght
    &lt;input name="fields[afternoon-lower-right]" type="text" />
  &lt;/label>
  &lt;label>Evening
    &lt;input name="fields[evening-tab]" type="text" />
  &lt;/label>
  &lt;label>Evening Concentration
    &lt;input name="fields[evening-concentration]" type="text" />
  &lt;/label>
  &lt;label>Evening Strength
    &lt;input name="fields[evening-strength]" type="text" />
  &lt;/label>
  &lt;label>Evening Motor Control
    &lt;input name="fields[evening-motor-control]" type="text" />
  &lt;/label>
  &lt;label>Evening Tremors
    &lt;input name="fields[evening-tremors]" type="text" />
  &lt;/label>
  &lt;label>Evening Pain
    &lt;input name="fields[evening-pain]" type="text" />
  &lt;/label>
  &lt;label>Evening Breath
    &lt;input name="fields[evening-breath]" type="text" />
  &lt;/label>
  &lt;label>Evening Temperature
    &lt;input name="fields[evening-temperature]" type="text" />
  &lt;/label>
  &lt;label>Evening Aches
    &lt;input name="fields[evening-aches]" type="text" />
  &lt;/label>
  &lt;label>Evening Allergies
    &lt;input name="fields[evening-allergies]" type="text" />
  &lt;/label>
  &lt;label>Evening Head and Neck
    &lt;input name="fields[evening-head]" type="text" />
  &lt;/label>
  &lt;label>Evening Chest
    &lt;input name="fields[evening-chest]" type="text" />
  &lt;/label>
  &lt;label>Evening Upper Right
    &lt;input name="fields[evening-upper-right]" type="text" />
  &lt;/label>
  &lt;label>Evening Upper Left
    &lt;input name="fields[evening-upper-left]" type="text" />
  &lt;/label>
  &lt;label>Evening Lower Right
    &lt;input name="fields[evening-lower-right]" type="text" />
  &lt;/label>
  &lt;label>Evening Lower Left
    &lt;input name="fields[evening-lower-left]" type="text" />
  &lt;/label>
  &lt;label>Wake
    &lt;input name="fields[wake-tab]" type="text" />
  &lt;/label>
  &lt;label>Wake Concentration
    &lt;input name="fields[wake-concentration]" type="text" />
  &lt;/label>
  &lt;label>Wake Strength
    &lt;input name="fields[wake-strength]" type="text" />
  &lt;/label>
  &lt;label>Wake Motor Control
    &lt;input name="fields[wake-motor-control]" type="text" />
  &lt;/label>
  &lt;label>Wake Tremors
    &lt;input name="fields[wake-tremors]" type="text" />
  &lt;/label>
  &lt;label>Wake Pain
    &lt;input name="fields[wake-pain]" type="text" />
  &lt;/label>
  &lt;label>Wake Breath
    &lt;input name="fields[wake-breath]" type="text" />
  &lt;/label>
  &lt;label>Wake Temperature
    &lt;input name="fields[wake-temperature]" type="text" />
  &lt;/label>
  &lt;label>Wake Aches
    &lt;input name="fields[wake-aches]" type="text" />
  &lt;/label>
  &lt;label>Wake Allergies
    &lt;input name="fields[wake-allergies]" type="text" />
  &lt;/label>
  &lt;label>Wake Head and Neck
    &lt;input name="fields[wake-head]" type="text" />
  &lt;/label>
  &lt;label>Wake Chest
    &lt;input name="fields[wake-chest]" type="text" />
  &lt;/label>
  &lt;label>Wake Upper Right
    &lt;input name="fields[wake-upper-right]" type="text" />
  &lt;/label>
  &lt;label>Wake Upper Left
    &lt;input name="fields[wake-upper-left]" type="text" />
  &lt;/label>
  &lt;label>Wake Lower Right
    &lt;input name="fields[wake-lower-right]" type="text" />
  &lt;/label>
  &lt;label>Wake Lower Left
    &lt;input name="fields[wake-lower-left]" type="text" />
  &lt;/label>
  &lt;label>Sleep
    &lt;input name="fields[sleep-tab]" type="text" />
  &lt;/label>
  &lt;label>Sleep Concentration
    &lt;input name="fields[sleep-concentration]" type="text" />
  &lt;/label>
  &lt;label>Sleep Strength
    &lt;input name="fields[sleep-strength]" type="text" />
  &lt;/label>
  &lt;label>Sleep Motor Control
    &lt;input name="fields[sleep-motor-control]" type="text" />
  &lt;/label>
  &lt;label>Sleep Tremors
    &lt;input name="fields[sleep-tremors]" type="text" />
  &lt;/label>
  &lt;label>Sleep Pain
    &lt;input name="fields[sleep-pain]" type="text" />
  &lt;/label>
  &lt;label>Sleep Breath
    &lt;input name="fields[sleep-breath]" type="text" />
  &lt;/label>
  &lt;label>Sleep Temperature
    &lt;input name="fields[sleep-temperature]" type="text" />
  &lt;/label>
  &lt;label>Sleep Aches
    &lt;input name="fields[sleep-aches]" type="text" />
  &lt;/label>
  &lt;label>Sleep Allergies
    &lt;input name="fields[sleep-allergies]" type="text" />
  &lt;/label>
  &lt;label>Sleep Head and Neck
    &lt;input name="fields[sleep-head]" type="text" />
  &lt;/label>
  &lt;label>Sleep Chest
    &lt;input name="fields[sleep-chest]" type="text" />
  &lt;/label>
  &lt;label>Sleep Upper Right
    &lt;input name="fields[sleep-upper-right]" type="text" />
  &lt;/label>
  &lt;label>Sleep Upper Left
    &lt;input name="fields[sleep-upper-left]" type="text" />
  &lt;/label>
  &lt;label>Sleep Lower Right
    &lt;input name="fields[sleep-lower-right]" type="text" />
  &lt;/label>
  &lt;label>Sleep Lower Left
    &lt;input name="fields[sleep-lower-left]" type="text" />
  &lt;/label>
  &lt;input name="action[chronic]" type="submit" value="Submit" />
&lt;/form></code></pre>
        <p>To edit an existing entry, include the entry ID value of the entry in the form. This is best as a hidden field like so:</p>
        <pre class="XML"><code>&lt;input name="id" type="hidden" value="23" /></code></pre>
        <p>To redirect to a different location upon a successful save, include the redirect location in the form. This is best as a hidden field like so, where the value is the URL to redirect to:</p>
        <pre class="XML"><code>&lt;input name="redirect" type="hidden" value="http://projects.enguin.com/health-diary/success/" /></code></pre>
        <h3>Can Of Spam Filter</h3>
        <p>To use the Can Of Spam filter, add the Can Of Spam event to your page and the following field to your form:</p>
        <pre class="XML"><code>&lt;input name="canofspam" value="{$canofspam}" type="hidden" /></code></pre>';
		}

		public function load(){
			if(isset($_POST['action']['chronic'])) return $this->__trigger();
		}

	}
