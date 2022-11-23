
with AWS.Response;
with AWS.Status;

package Default.Callbacks is

   use AWS;

   function Default (Request : in Status.Data) return Response.Data;

end Default.Callbacks;
