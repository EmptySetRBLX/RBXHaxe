const rimraf = require('rimraf');
const strStream = require('string-to-stream');
const fs = require('fs');

const ClassJSONFileDumpDir = "ClassJsonDump";
const EnumJSONFileDumpDir = 'EnumJsonDump';

async function dumpClassJsonFiles(json)
{
    
    let classes = json.Classes;
    for(let i = 0; i < classes.length; i++)
    {
        let classJson = JSON.stringify(classes[i], null, 4);
        let name = classes[i].Name;

        let file = fs.createWriteStream('./' + ClassJSONFileDumpDir + '/' + name + '.json');
        strStream(classJson).pipe(file);
    }
}

async function dumpEnumFiles(json)
{
    let enums = json.Enums;
    for(let i = 0; i < enums.length; i++)
    {
        let enumJson = JSON.stringify(enums[i], null, 4);
        let name = enums[i].Name;

        let file = fs.createWriteStream('./' + EnumJSONFileDumpDir + '/' + name + '.json');
        strStream(enumJson).pipe(file);
    }
}


async function dumpJsons(json){
    rimraf(ClassJSONFileDumpDir, (error) => //remove old directory
    {
        if(error !== null)
        {
            throw error;
            return;
        }
        fs.mkdir(ClassJSONFileDumpDir, (error) => 
        {
            if(error !== null)
            {
                throw error;
                return;
            }
            dumpClassJsonFiles(json);
        });
    } );

    rimraf(EnumJSONFileDumpDir, (error) => //remove old directory
    {
        if(error !== null)
        {
            throw error;
            return;
        }
        fs.mkdir(EnumJSONFileDumpDir, (error) => 
        {
            if(error !== null)
            {
                throw error;
                return;
            }
            dumpEnumFiles(json);
        });
    } );
}

module.exports = dumpJsons;