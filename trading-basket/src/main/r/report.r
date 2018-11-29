orders <- read.csv('out-orders.csv') # insert output file here
statistics <- read.csv('ut-pnl.csv') # insert output file here
statistics$date = as.Date(statistics$date)

deposit = 15000
plot(statistics$date, (deposit+statistics$pl)/deposit-1, type='l', xlab = 'Date', ylab='Returns')

pctWin = sum(orders$pl > 0)/length(orders$pl)
print(paste('Win percentage: ', pctWin*100, '%'))

## specific to the cointegration strategy

kalmanStatistics = read.csv('out-cointeg.csv') # insert output file here
kalmanStatistics$date = as.Date(kalmanStatistics$date)

plot(kalmanStatistics$beta, type='l')

series = kalmanStatistics$y - kalmanStatistics$x * kalmanStatistics$beta - kalmanStatistics$alpha

plot(kalmanStatistics$date[50:length(series)], series[50:length(series)], type='l', xlab = 'Date', ylab='Residuals')
