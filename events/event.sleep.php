<?php

	require_once(TOOLKIT . '/class.event.php');

	Class eventsleep extends SectionEvent{

		public $ROOTELEMENT = 'sleep';

		public $eParamFILTERS = array(
			'canofspam'
		);

		public static function about(){
			return array(
				'name' => 'Sleep',
				'author' => array(
					'name' => 'Bernard Yu',
					'website' => 'http://projects.enguin.com/health-diary',
					'email' => 'bernard@enguin.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-07-25T23:10:37+00:00',
				'trigger-condition' => 'action[sleep]'
			);
		}

		public static function getSource(){
			return '3';
		}

		public static function allowEditorToParse(){
			return true;
		}

		public static function documentation(){
			return '
        <h3>Success and Failure XML Examples</h3>
        <p>When saved successfully, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;sleep result="success" type="create | edit">
  &lt;message>Entry [created | edited] successfully.&lt;/message>
&lt;/sleep></code></pre>
        <p>When an error occurs during saving, due to either missing or invalid fields, the following XML will be returned:</p>
        <pre class="XML"><code>&lt;sleep result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;field-name type="invalid | missing" />
  ...
&lt;/sleep></code></pre>
        <p>The following is an example of what is returned if any options return an error:</p>
        <pre class="XML"><code>&lt;sleep result="error">
  &lt;message>Entry encountered errors when saving.&lt;/message>
  &lt;filter name="admin-only" status="failed" />
  &lt;filter name="send-email" status="failed">Recipient not found&lt;/filter>
  ...
&lt;/sleep></code></pre>
        <h3>Example Front-end Form Markup</h3>
        <p>This is an example of the form markup you can use on your frontend:</p>
        <pre class="XML"><code>&lt;form method="post" action="" enctype="multipart/form-data">
  &lt;input name="MAX_FILE_SIZE" type="hidden" value="2097152" />
  &lt;label>Sleep time
    &lt;input name="fields[sleep-time][start][]" type="text" />
    &lt;input name="fields[sleep-time][end][]" type="text" />
  &lt;/label>
  &lt;label>Alarm
    &lt;input name="fields[alarm]" type="text" />
  &lt;/label>
  &lt;label>Author
    &lt;select name="fields[author]">
      &lt;option value="1">Bernard Yu&lt;/option>
      &lt;option value="2">Jeni Gudgeon&lt;/option>
      &lt;option value="3">Test McTestipants&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Wake feeling
    &lt;select name="fields[wake-feeling]">
      &lt;option value="Very sleepy">Very sleepy&lt;/option>
      &lt;option value="Awake but tired">Awake but tired&lt;/option>
      &lt;option value="Wide awake">Wide awake&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Sleep Feeling
    &lt;select name="fields[sleep-feeling]">
      &lt;option value="Very sleepy">Very sleepy&lt;/option>
      &lt;option value="Awake but tired">Awake but tired&lt;/option>
      &lt;option value="Wide awake">Wide awake&lt;/option>
    &lt;/select>
  &lt;/label>
  &lt;label>Waking up
    &lt;input name="fields[waking-up]" type="text" />
  &lt;/label>
  &lt;label>Spent awake
    &lt;input name="fields[spent-awake]" type="text" />
  &lt;/label>
  &lt;label>Comment
    &lt;textarea name="fields[comment]" rows="15" cols="50">&lt;/textarea>
  &lt;/label>
  &lt;input name="action[sleep]" type="submit" value="Submit" />
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
			if(isset($_POST['action']['sleep'])) return $this->__trigger();
		}

	}
