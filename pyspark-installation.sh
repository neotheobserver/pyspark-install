set -e

if [[ $# -lt 1 ]]
then
echo "Not enough Arguments...."
echo "Example usage: "
echo "./pyspark-installation pyspark_ver [OPTINAL: aws_bundle_ver]"
echo "./pyspark-installation 3.3.1 1.12.99"
exit -1
fi


python_version="$(python3 --version | grep -oE "[0-9]+\.[0-9]+")"
echo "Python installed version: $python_version"

python3 -m venv venv

echo "Activating virtual environment...."
source venv/bin/activate

echo "Installing Pyspark..."
pip install pyspark==$1 
echo "Installing Jupyter Notebook..."
pip install notebook

jar_path="venv/lib/python$python_version/site-packages/pyspark/jars/"

if ! [ -f ${jar_path}/hadoop-aws-$1.jar ] 
then
    hadoop_url="https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/$1/hadoop-aws-$1.jar"
    echo "Downloading hadoop aws jar file from: $hadoop_url"
    curl -O --output-dir $jar_path $hadoop_url
else
    echo "Skipping hadoop aws jar download...File already exists"
fi

if ! [ -z $2 ]
then
    if ! [ -f ${jar_path}/aws-java-sdk-bundle-$2.jar ] 
    then
        aws_bundle_url="https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/$2/aws-java-sdk-bundle-$2.jar"
        echo "Downloading aws bundle: $aws_bundle_url"
        curl -O --output-dir $jar_path $aws_bundle_url
    else
        echo "Skipping aws bundle jar...File already exists"
    fi
else
    echo "AWS bundle version not provided...Skipping download"
fi

if [ -z "$JAVA_HOME" ]
then
    echo "JAVA_HOME variable is not set"
    echo "Make sure the java version installed is compatible with the pyspark version installed"
fi

