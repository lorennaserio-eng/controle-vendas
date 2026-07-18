/*
  Conexão com o Supabase.

  A URL e a "anon key" abaixo NÃO são segredos: elas só permitem o que
  as regras de segurança (Row Level Security) no banco autorizarem —
  por isso é seguro publicar este arquivo no GitHub.

  NUNCA coloque aqui a "service_role key" do Supabase — essa sim dá
  acesso total ao banco e deve ficar só no painel do Supabase.

  Onde encontrar seus valores: supabase.com > seu projeto > Project
  Settings > API > "Project URL" e "anon public".
*/

const SUPABASE_URL = 'https://hunxqyxlzcfxsrnoxpqr.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_7PpTpQA4pogIXB8nicxTPw_ipJDjoz5';

const supabaseClient = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
