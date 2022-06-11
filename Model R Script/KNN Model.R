# Cross validating the data with 5 folds.
control <- trainControl(method = "cv", 
                        number = 5)

# Fitting the K Neearest Neighbour model to the data set.
kfold_model_knn <- train(blueWins ~., 
                         data = train, 
                         trControl = control, 
                         method = "knn")

# Prints out the K Nearest Neighbor Model results
print(kfold_model_knn)

# Fitting

pred <- predict(kfold_model_knn, newdata = test)
cm <- table(pred, test$blueWins)
confusionMatrix(cm)