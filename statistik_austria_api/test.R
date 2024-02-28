library(STATcubeR)

sc_key_set("65794a30655841694f694a4b563151694c434a68624763694f694a49557a49314e694a392e65794a7063334d694f694a7a644849756333526c6247786863694973496e4e3159694936496d396d5a6d6c6a5a55426c593239756232317059324575595851694c434a70595851694f6a45314e7a49794e4455774e444973496d46315a434936496e4e30636935765a47456966512e666e34656d6d415338587551754a584f6638486b706456426e6b516674494c4d4866736d2d652d62697041")

my_catalogue <- sc_schema_catalogue()

db_konj_id <- my_catalogue$`Publications and services`$`Economic Trend Monitor`$`Economic Trend Monitor`$id

db_konj_info <- sc_schema_db(konj_id)

table_konj <- sc_table(json_file = "Konjunkturmonitor.json")

df_konj <- as.data.frame(table_konj)

table_konj <- sc_table(json_file = "CopyOfKonjunkturmonitor.json")
