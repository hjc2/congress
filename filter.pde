

Table filterTableByCongress(Table inputTable, int year) {
  Table outputTable = new Table();

  for (int i = 0; i < inputTable.getColumnCount(); i++) {
    String columnName = inputTable.getColumnTitle(i);
    outputTable.addColumn(columnName);
  }

  // Iterate through each row of the input table
  for (TableRow row : inputTable.rows()) {
    // Check if the "congress" field has a value of 115
    if (row.getInt("congress") == year) {

      TableRow newRow = outputTable.addRow();      
      for (int i = 0; i < inputTable.getColumnCount(); i++) {
        
        //String columnName = inputTable.getColumnTitle(i);
        //newRow.setFloat(columnName, row.getFloat(columnName));
        
        newRow.setString("chamber", row.getString("chamber"));
        newRow.setString("bioguide", row.getString("bioguide"));

        newRow.setString("district", row.getString("district"));
        newRow.setString("party", row.getString("party"));
        
        newRow.setInt("congress", row.getInt("congress"));
        
        newRow.setFloat("agree_pct", row.getFloat("agree_pct"));

      }
    }
  }

  return outputTable;
}
