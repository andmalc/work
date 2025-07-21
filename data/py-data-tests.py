import pandas as pd
import numpy as np
# Make df from dictionary of two Serieses
d={
    'col1':pd.Series([1, 3, 5, np.nan, 6, 8]),
    'col2':pd.Series([1, 3, 5, 4, 6, 8])

}
df=pd.DataFrame(d)
# df from date range and random numbers
dates=pd.date_range('20130101',periods=6)
dfDates=pd.DataFrame(np.random.randn(6,4),index=dates)
# import two columsn from Bird Strike csv.
strikes=pd.read_csv("faa-wildlife-strikes.csv", usecols=["OPERATOR","ATYPE"], nrows=40)
# Row filter
strikes_selected = strikes[strikes['OPERATOR'].isin(["AMERICAN AIRLINES","EXPRESSJET AIRLINES"])]

# Filter + Column selection.  Use loc with condition first, a comma, then the column to return.
strikes_selected_atype= strikes.loc[
    strikes['OPERATOR'] == "EXPRESSJET AIRLINES",
    "ATYPE"
]
