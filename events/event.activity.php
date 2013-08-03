<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventactivity extends SectionEvent{

		public $ROOTELEMENT = 'activity';

		public $eParamFILTERS = array(
			'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'Activity',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-25T23:11:09+00:00',
				'trigger-condition' => 'action[activity]'
			);
		}

		public static function getSource(){
			return '6';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;activity result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/activity></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;activity result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/activity></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;activity result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/activity></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
  &lt;label>Metadata
    &lt;input name="fields[metadata]" type="text" />
  &lt;/label>
  &lt;label>Day
    &lt;input name="fields[day][start][]" type="text" />
    &lt;input name="fields[day][end][]" type="text" />
  &lt;/label>
  &lt;label>Author
    &lt;select name="fields[author]">
      &lt;option value="1">Bernard Yu&lt;/option>
      &lt;option value="2">Jeni Gudgeon&lt;/option>
      &lt;option value="3">Test McTestipants&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Day Type
    &lt;select name="fields[type]">
      &lt;option value="Work">Work&lt;/option>
      &lt;option value="Off">Off&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Work time
    &lt;input name="fields[work-time][start][]" type="text" />
    &lt;input name="fields[work-time][end][]" type="text" />
  &lt;/label>
  &lt;label>Sick Day
    &lt;select name="fields[sick-day]">
      &lt;option value="No">No&lt;/option>
      &lt;option value="Partial">Partial&lt;/option>
      &lt;option value="Yes">Yes&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Comment
    &lt;textarea name="fields[description]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;label>Tags
    &lt;input name="fields[tags]" type="text" />
  &lt;/label>
  &lt;label>Morning
    &lt;input name="fields[morning]" type="text" />
  &lt;/label>
  &lt;label>Morning Wakefulness
    &lt;select name="fields[morning-wakefulness]">
      &lt;option value="Struggle to stay awake">Struggle to stay awake&lt;/option>
      &lt;option value="Somewhat tired">Somewhat tired&lt;/option>
      &lt;option value="Fairly alert">Fairly alert&lt;/option>
      &lt;option value="Wide awake">Wide awake&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Morning Mental State
    &lt;select name="fields[morning-mental-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Morning Stress
    &lt;select name="fields[morning-stress]">
      &lt;option value="Very Low">Very Low&lt;/option>
      &lt;option value="Low">Low&lt;/option>
      &lt;option value="Moderate">Moderate&lt;/option>
      &lt;option value="High">High&lt;/option>
      &lt;option value="Very High">Very High&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Morning Body State
    &lt;select name="fields[morning-body-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Morning Wellness
    &lt;select name="fields[morning-wellness]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Afternoon Wakefulness
    &lt;select name="fields[afternoon-wakefulness]">
      &lt;option value="Struggle to stay awake">Struggle to stay awake&lt;/option>
      &lt;option value="Somewhat tired">Somewhat tired&lt;/option>
      &lt;option value="Fairly alert">Fairly alert&lt;/option>
      &lt;option value="Wide awake">Wide awake&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Afternoon
    &lt;input name="fields[afternoon]" type="text" />
  &lt;/label>
  &lt;label>Afternoon Body State
    &lt;select name="fields[afternoon-body-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Afternoon Mental State
    &lt;select name="fields[afternoon-mental-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Afternoon Stress
    &lt;select name="fields[afternoon-stress]">
      &lt;option value="Very Low">Very Low&lt;/option>
      &lt;option value="Low">Low&lt;/option>
      &lt;option value="Moderate">Moderate&lt;/option>
      &lt;option value="High">High&lt;/option>
      &lt;option value="Very High">Very High&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Afternoon Wellness
    &lt;select name="fields[afternoon-wellness]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Evening
    &lt;input name="fields[evening]" type="text" />
  &lt;/label>
  &lt;label>Evening Wakefulness
    &lt;select name="fields[evening-wakefulness]">
      &lt;option value="Struggle to stay awake">Struggle to stay awake&lt;/option>
      &lt;option value="Somewhat tired">Somewhat tired&lt;/option>
      &lt;option value="Fairly alert">Fairly alert&lt;/option>
      &lt;option value="Wide awake">Wide awake&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Evening Body State
    &lt;select name="fields[evening-body-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Evening Wellness
    &lt;select name="fields[evening-wellness]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Evening Stress
    &lt;select name="fields[evening-stress]">
      &lt;option value="Very Low">Very Low&lt;/option>
      &lt;option value="Low">Low&lt;/option>
      &lt;option value="Moderate">Moderate&lt;/option>
      &lt;option value="High">High&lt;/option>
      &lt;option value="Very High">Very High&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Evening Mental State
    &lt;select name="fields[evening-mental-state]">
      &lt;option value="Terrific">Terrific&lt;/option>
      &lt;option value="Good">Good&lt;/option>
      &lt;option value="Medium">Medium&lt;/option>
      &lt;option value="Poor">Poor&lt;/option>
      &lt;option value="Terrible">Terrible&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;input name="action[activity]" type="submit" value="Submit" />
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
			if(isset($_POST['action']['activity'])) return $this->__trigger();
		}

	}
