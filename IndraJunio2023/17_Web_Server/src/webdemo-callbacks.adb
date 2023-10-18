
with AWS.Messages;
with AWS.MIME;

package body Webdemo.Callbacks is

   -------------
   -- Default --
   -------------

   function Default (Request : in Status.Data) return Response.Data is
      URI : constant String := Status.URI (Request);
   begin
      if URI = "/" then
         return Response.Build
           (MIME.Text_HTML, "<h1>Hola Mundo Ada</h1>");
      elsif URI = "/Caracteristicas" then
           return Response.Build(MIME.Text_HTML, "<h3>Ada en el mundo WEB es posible!</h3>");
      else
         return Response.Acknowledge (Messages.S404);
      end if;
   end Default;

end Webdemo.Callbacks;
