-- ================================================================
-- Migração: Gestão de Clientes (cadastro completo, lembretes de
-- reposição, aniversário automático, clientes sumidas, oportunidade
-- de negócio).
-- Rode este script INTEIRO no SQL Editor do Supabase (uma vez só).
-- Só adiciona colunas novas, não apaga nada.
-- ================================================================

alter table customers add column if not exists skin_type text;
alter table customers add column if not exists last_birthday_greeting_year integer;
alter table customers add column if not exists address text;
alter table customers add column if not exists notes text;
alter table customers add column if not exists business_prospect boolean not null default false;
alter table products add column if not exists replenish_days integer;
alter table settings add column if not exists meta_birthday_template_name text;
