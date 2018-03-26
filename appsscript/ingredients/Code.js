//function onOpen() {
//  SpreadsheetApp.getUi().createMenu("My Menu").addItem("Greeting","greeting").addToUi();
//}
//
//function greeting() {
//  var ui =   SpreadsheetApp.getUi();
//  ui.alert("Greeting", "Hello",ui.ButtonSet.OK);
// }

function onOpen() {
  SpreadsheetApp.getUi() // Or DocumentApp or FormApp.
      .createMenu('Custom Menu')
      .addItem('Show sidebar', 'showSidebar')
      .addToUi();
}

function copyDown2() {
  var sheet = SpreadsheetApp.getActiveSheet();
  var recipeCell = sheet.getActiveRange();
  var recipeName = recipeName.getValue();
  var targetCell = recipeCell.offset(0,-2);
  var lastCell = targetCell;
//  do {
//    lastCell = lastCell.offset(1,0);
//  } while lastCell. 
    
}

  Logger.log(range.getRow());
  var recipe = range.offset(0,-2).getValue();
  range.setValue(recipe);
  
//  var rangeToCopy = range.offset(-2,0)
//  var rows = range.getNumRows();
//  var cols = range.getNumColumns();
// };



function copyDown() {
  var sheet = SpreadsheetApp.getActiveSheet();
  var range = sheet.getActiveRange();
  Logger.log(range.getRow());
  var recipe = range.offset(0,-2).getValue();
  range.setValue(recipe);
  
//  var rangeToCopy = range.offset(-2,0)
//  var rows = range.getNumRows();
//  var cols = range.getNumColumns();
};

