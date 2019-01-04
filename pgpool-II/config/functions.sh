#!{{pkgPathFor "core/bash"}}/bin/bash

init_pgpool_pass() {
{{#if bind.database}}
  {{#eachAlive bind.database.members as |member|}}
    {{#if @last}}
  pg_md5 --config-file {{pkg.svc_config_path}}/pgpool.conf --md5auth --username={{member.cfg.superuser_name}} {{member.cfg.superuser_password}}
    {{/if}}
  {{/eachAlive}}
{{/if}}
}
