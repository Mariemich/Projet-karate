function fn() {
  var env = karate.env || 'local';
  var config = {
    baseUrl: 'https://api.efi-academy.com/user-api/public',
    adminEmail: 'admin@test.com',
    adminPassword: 'Admin123!',
    email: 'jean@example.com',
    password: 'secret123'
 };
  if (env == 'recette') {
    config.baseUrl = 'https://api.efi-academy.com/user-api/public';
  }
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}





/*function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}*/

