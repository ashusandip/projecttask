const sonarqubeScanner = require('sonarqube-scanner');

sonarqubeScanner({
  serverUrl: 'http://3.83.225.105:9000/',
       options : {
	    'sonar.projectDescription': 'This is a Node JS application',
	    'sonar.projectName': 'NodeJs project',
	    'sonar.projectKey':'NodeJs',
	    'sonar.login': 'admin',
            'sonar.password': 'SonarQube',
	    'sonar.token': 'sqp_c65d9b8decfa27b3482887c1a04ae544ca25b367',
            'sonar.projectVersion':'1.0',
	    'sonar.language':'js',
            'sonar.sourceEncoding':'UTF-8',
            'sonar.sources': '.',
	    //'sonar.tests': 'specs',
           //'sonar.inclusions' : 'src/**'
       },
}, () => {});
