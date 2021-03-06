echo "You are about to update to version ${1}. Please confirm upgrade with Y."

read confirmation
if [ $confirmation != "Y" ]
then
    echo No confirmation, exiting.
    exit
fi

python setup.py sdist
twine upload "dist/draft_kings_db-${1}.tar.gz"

git add .
git commit -m "Bump version to ${1}"
git tag $1
git push origin --tags