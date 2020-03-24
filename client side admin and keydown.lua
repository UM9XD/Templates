local get_service = game.GetService
local input_service = get_service(game, "UserInptService")
local action_service = get_service(game, "ContextActionService")
local players_service = get_service(game, "Players")
local player = players_service.LocalPlayer
local player_mouse = player:GetMouse()
local textbox_read = false
local keys_table = {};
local commands_table = {};
local split_key = " "
local user_prefix = ";"

local function split_string( string_code )
    if (not type(split_key) == "string") then return {string_code} end;
    if (not type(string_code) == "string") then return {string_code} end;
    if ( string_code:find( split_key ) ) then
	local string_table = {};
	for args in string_code:gmatch("[^"..split_key.."]+") do
		table.insert(string_table, args)
	end
	return string_table
	end
end;

local function add_key(name, left_shift, key_down, func)
	table.insert(keys_table,{
		["Name"] = name,
		["Key"] = key_down,
		["Shifted"] = left_shift,
		["Toggled"] = false,
		["Function"] = func
	})
end;

local function add_command(name, desc, usages, func)
	table.insert(commands_table,{
		["Name"] = name,
		["Description"] = desc,
		["Usages"] = usages,
		["Toggled"] = false,
		["Function"] = func,
	})
end;

local function CommandCheck(Message)
	local Message = Message:gsub("^/e?m?o?t?e?%s?","")
	for _,commandTable in next, commands_table do
		for _,commandUsage in next, commandTable["Usages"] do
			
			if (string.lower(Message):sub(1, #commandUsage + #user_prefix) == user_prefix..commandUsage) then
					local Message = Message:sub(1 + #commandUsage + #user_prefix)
					local Arguments = split_string(Message);
					commandTable.Toggled = not commandTable.Toggled
					local MainFunction, MainError = pcall(commandTable.Function, Message, Arguments, commandTable.Toggled)
					if not MainFunction then
						warn(tostring(MainError))
						return false
					end
					return true
			end	
		end
	end
end;

input_service.TextBoxFocused:Connect( function( TextBox )
	local result, Error = pcall(function()
		if (readingTextBox) then return end;
		readingTextBox = true;
		
		connectionFocus = TextBox.FocusLost:Connect(function(EnterPressed)
			if (not EnterPressed) then return end;
			if (not readingTextBox) then return end;
			readingTextBox = false;
			
			local textLogged = tostring( TextBox.Text );
			CommandCheck(textLogged);
			connectionFocus:Disconnect();
		end)
	end)
	if (not result) then return warn(Error) end;
end);

player_mouse.KeyDown:Connect(function()
	for Index,Value in next, keys_table do
		if type(Value["Function"]) == "function" then
			if Value["Shifted"] then
				if action_service:IsKeyDown(Enum.KeyCode.LeftShift) and action_service:IsKeyDown(Enum.KeyCode[Value.Key]) then
					Value["Toggled"] = not Value["Toggled"]
					Value["Function"](Value["Toggled"]);
					return 'Executed'
				end
			else
				if action_service:IsKeyDown(Enum.KeyCode[Value.Key]) and not action_service:IsKeyDown(Enum.KeyCode.LeftShift) then
					Value["Toggled"] = not Value["Toggled"]
					Value["Function"](Value["Toggled"]);
					return 'Executed'
				end
			end
		end
	end
end);

--//Keys\\--

add_key("Test", false, "B", function(Toggle)
    warn(Toggle)
end);

--//Commands\\--

add_command("Test", "Testy Test", {"test", "testing"}, function(Message, Arguments, Toggle)
	local ASD = (table.concat(Arguments, "\n") or Message)
	print(ASD, Toggle);
	warn"Test"
end);
