
with AWS.Config.Set;
with AWS.Server;

with Default.Callbacks;

procedure Default.Main is
   use AWS;

   Web_Server : Server.HTTP;
   Web_Config : Config.Object;

begin
   --  Setup

   Config.Set.Server_Host (Web_Config, Host);
   Config.Set.Server_Port (Web_Config, Port);

   --  Start the server

   Server.Start (Web_Server, Callbacks.Default'Access, Web_Config);

   --  Wait for the Q key

   Server.Wait (Server.Q_Key_Pressed);

   --  Stop the server

   Server.Shutdown (Web_Server);
end Default.Main;
