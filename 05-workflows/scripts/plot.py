from optparse import OptionParser
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


parser = OptionParser()

parser.add_option("-i","--input", dest="input", help="input path")
parser.add_option("-o","--output", dest="output", help="output path")
(options, args) = parser.parse_args()

df = pd.read_csv(options.input, header=None, names=["data", "winning_numbers", "multiplier"])
sns.histplot(data=df, x="multiplier")
plt.title("Counts of Multipliers")
plt.xlabel("Multipliers")
plt.ylabel("Count")
plt.savefig(options.output)
