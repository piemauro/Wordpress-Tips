# Fix blogger importer Erros
Como corrigir erro do importador do blogger

Um problema muito comum ao importar um xml do blogger para Wordpress é o Warning para argumento invalido:
> https://prnt.sc/10v4t2z

![alt text](wordpress-tips-blogger-importer-1.png)

Basta realizar a substituição do arquivo parser.php na pasta wp-includes/SimplePie e voilá! (voa-la)

Creditos: https://wordpress.org/support/topic/xml-parsing-not-in-chunks-parser-out-of-memory/