extends Node

var card_database

func _on_ready():
	import_json("res://data/card_data.json") #debug purposes
	#card_database = import_json("res://data/card_data.json")
	
func import_json(path):
	var file = FileAccess.open(path, FileAccess.READ)
	var file_content = file.get_as_text()
	
	var json = JSON.new()
	#var json_data = json.parse(file_content)
	
	var error = json.parse(file_content)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			print(data_received) # Prints the array.
			return data_received
		else:
			print("Unexpected data")
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", file_content, " at line ", json.get_error_line())

	
	file.close()
	
	#var data_output = json_data.result
	#print(data_output)
	#return data_output
