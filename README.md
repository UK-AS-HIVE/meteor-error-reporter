meteor-error-reporter
=====================
Currently this serves only as a proof of concept.

Current Features:
1. Monitor connection to the server and display message if client gets disconnected, as well as when client reconnects. 
2. Displays an Error Message to the user if a client unhandled error occurs.
3. Basic feedback support

To-do:

1. Store Errors in an Error collection as well as send an email (or any kind of notification) when unhandled errors occur.
2. Catch unhandled server-side errors and add them to the collection as well as notify developer.
3. Implement email notifications
4. Allow user to add information on how to replicate the error
5. Improve feedback functionality

Extra feautures to-do: 

1. Write tests to ensure code consistency.
