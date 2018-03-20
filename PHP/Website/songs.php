<?php
/*PHP Class Declaration*/
class Song {
	public $name;
	public $purchased;
	public $note;
	public function __construct($songName) {
		$this->name = $songName;
		$this->note = "No Notes";
	}
	public function setNote($note)
	{
		$this->note = $note;
	}
}
?>