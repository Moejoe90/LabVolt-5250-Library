function obj = init_Robot(port)

obj = serial(port, 'Baudrate', 9600, 'DataBits', 8 ,'StopBits', 1);

obj.FlowControl = 'software';

obj.RequestToSend = 'off';

obj.DataTerminalReady = 'off';

obj.Terminator = 'CR';

fopen(obj);

readasync(obj);

end
