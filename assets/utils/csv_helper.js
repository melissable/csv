import Papa from 'papaparse';

export default {
  readCSVFiles(files, onRead, onError = null) {
    for(var i=0; i<files.length; i++)
    {
      var reader = new FileReader();
      reader.onload = function(e) {
        const parseResult = Papa.parse(e.target.result);
        onRead(parseResult);
      };
      reader.onerror = (onError) ? onError : function(err) { console.error(err); };
      reader.readAsText(files[i]);
    }
  },

  readCSVFile(file, onRead, onError = null) {
    var reader = new FileReader(file);
    console.log('reader', file)
    reader.onload = function(e) {
      const parseResult = Papa.parse(e.target.result);
      console.log('parseResult', parseResult)
      onRead(parseResult);
    };
    reader.onerror = (onError) ? onError : function(err) { console.error(err); };
    reader.readAsText(file);
  }
}
