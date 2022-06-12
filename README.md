# Introdução

O objetivo dessa arquitetura é aproveitar todas as vantagens do ecossistema Rails mas tentar organizar nossos códigos de
forma que seja um pouco mais fácil de escalar e manter. Então provavelmente terão implementações mais trabalhosas de na
arquitetura explicada a seguir, mas em contrapartida, acreditamos que ajudarão na manutenção do ao longo prazo.

Dentro da pasta `/app` temos as seguintes pastas:
- `/api`
- `/assets`
- `/controllers`
- `/decorators`
- `/jobs`
- `/models`
- `/views`


### API (`app/api`)
Nessa pasta ficam as classes que definem as rotas de entrada. Salvo exceções, toda a interação do mundo externo com
nossa aplicação é realizada através de requisições para nossas rotas da API.

As APIs não devem ter regra de negócio implementada dentro delas. Exemplificando: elas não devem persistir um registro
no banco de dados ali, nem devem disparar e-mail ou executar um job. O único papel das APIs na nossa arquitetura é
definir como a requisição deve ser recebida (a rota, os parâmetros, o método HTTP).

### Decorators (`app/decorators`)
Aqui ficam as classes que implementam o padrão decorator, utilizando a gem draper.

### Jobs  (`app/jobs`)
Os jobs são classes que servem para executar código assíncronamente. Mais sobre o assunto pode ser encontrado [aqui.](
https://guides.rubyonrails.org/active_job_basics.html).

Os jobs devem ter o mínimo de conhecimento da regra de negócio, o papel deles se limita a buscar um objeto e chamar um
método ou delegar o processamento para uma action

### Ambiente

| Ambiente | Status |
|----------|--------|
| ruby     | 3.1.2  |
| rails    | 6      |
| redis    | 6.2.2  |
| docker   | 3.4    |

### Para execução da aplicação basta configurar suas variaveis de ambiente em .dockerfiles/.env e executar 'docker-compose up'



