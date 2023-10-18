
with AWS.Response;
with AWS.Status;

package Webdemo.Callbacks is

   use AWS;

   function Default (Request : in Status.Data) return Response.Data;

end Webdemo.Callbacks;
