class Main
{

    static var sBaseUri = "http://localhost/api/";

    static function main(mc:MovieClip)
    {

        trace("!@# Overriding NetServiceProxy.__resolve()");
        NetConnection.prototype.isRealTime = function()
        {
            return true;
        };

        _level0.sDefaultLoginDenizenServer = Main.sBaseUri + "login";

        _global.NetServiceProxy.prototype.__resolve = function(methodName)
        {
            trace("!@# CALLED __resolve");

            trace("!@# Calling: " + methodName);
            trace("!@# Arguments: " + arguments);

            var remoteFunction = function()
            {
                var requestData = new LoadVars();
                var responseData = new LoadVars();

                // Prepare data to send
                requestData.methodName = methodName;
                for (var i = 1; i < arguments.length; i++)
                {
                    requestData["arg" + i] = arguments[i];
                }

                // Handle server response
                responseData.onLoad = function(success:Boolean)
                {
                    if (success)
                    {
                        this.onResult(this);

                    }
                    else
                    {
                        trace("!@# Error loading data.");
                    }
                };

                // Send data
                requestData.sendAndLoad(Main.sBaseUri + methodName, responseData, "POST");
            };
            return remoteFunction;
        };

    }

}
