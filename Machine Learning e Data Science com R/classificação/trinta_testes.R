base = read.csv('credit_data.csv')
base$clientid = NULL
base$age = ifelse(base$age < 0, 40.92, base$age)
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)
base[, 1:3] = scale(base[, 1:3])
base$default = factor(base$default, levels = c(0,1))

library(caret)
resultados30 = c()
for (i in 1:30) {
  controle_treinamento = trainControl(method = 'cv', number = 10)
  modelo = train(default ~ ., data = base, trControl = controle_treinamento, method = 'rpart')
  precisao = modelo$results$Accuracy[2]
  print(precisao)
  resultados30 = c(resultados30, precisao)
}

for (i in 1:30) {
  cat(gsub('[.]', ',', resultados30[i])) 
  cat('\n')
}