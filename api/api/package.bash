cd $VENV_DIR && zip -r9 "$ROOT_DIR/lambda.zip" . \
&& cd "$ROOT_DIR/api" && zip -g ../lambda.zip -r .

cd $ROOT_DIR && aws s3 cp lambda.zip s3://$NAME/api/lambda.zip --profile $AWS_PROFILE

aws lambda update-function-code --function-name $NAME \
--s3-bucket $NAME --s3-key api/lambda.zip --profile $AWS_PROFILE

aws lambda update-function-configuration --function-name $NAME --environment {\"Variables\":{\"URL\":\"${URL}\"}} --profile $AWS_PROFILE
