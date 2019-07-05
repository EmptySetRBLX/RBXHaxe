const request = require('request');
const fs = require('fs');
const versionHashUrl = "http://setup.roblox.com/versionQTStudio";


async function getJson(callback)
{
    //get version hash to pass to setup url
    request(versionHashUrl, (error, response, body) => 
    {
        let hash = body;
        let apiJsonUrl = "http://setup.roblox.com/" + hash + "-API-Dump.json";

        if(error !== null)
        {
            callback(error, null);
            return;
        }

        //get api json dump
        request(apiJsonUrl, (error, response, body) => 
        {
            if(error !== null){
                callback(error, null);
                return;
            }
            fs.writeFile('rawJsonDump.json', body, () => {console.log('json dumped to file');});
            try{
                callback(null, JSON.parse(body));
            }catch(error)
            {
                callback(error, null);
            }
        });
    });
}

module.exports = getJson;