from optparse import OptionParser
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


parser = OptionParser()

parser.add_option("-i","--input", dest="input", help="input path")
parser.add_option("-o","--output", dest="output", help="output path")
(options, args) = parser.parse_args()

df = pd.read_csv(options.input, names=['draw_data, winning_numbers, multiplier'])
sns.histplot(data=df, x="winning_numbers")
plt.title("Counts of Winning Lottery Numbers")
plt.xlabel("Winning Numbers")
plt.tlabel("Count")
plt.savefig(options.output)