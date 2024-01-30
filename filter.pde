

Table filterTableByCongress(Table inputTable, int year) {
  Table outputTable = new Table();

  for (int i = 0; i < inputTable.getColumnCount(); i++) {
    String columnName = inputTable.getColumnTitle(i);
    outputTable.addColumn(columnName);
  }

  for (TableRow row : inputTable.rows()) {
    if (row.getInt("congress") == year) {
      TableRow newRow = outputTable.addRow();      
        
      newRow.setString("chamber", row.getString("chamber"));
      newRow.setString("bioguide", row.getString("bioguide"));
      newRow.setString("last_name", row.getString("last_name"));
      newRow.setString("state", row.getString("state"));
      newRow.setString("district", row.getString("district"));
      newRow.setString("party", row.getString("party"));
      newRow.setString("predicted_agree", row.getString("predicted_agree"));
     
      newRow.setInt("votes", row.getInt("votes"));
      newRow.setInt("congress", row.getInt("congress"));
      
      newRow.setFloat("agree_pct", row.getFloat("agree_pct"));
      newRow.setFloat("net_trump_vote", row.getFloat("net_trump_vote"));
    }
  }

  return outputTable;
}
