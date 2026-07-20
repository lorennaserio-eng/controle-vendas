-- ================================================================
-- Migração: Agenda Inteligente (tipo de evento na agenda da equipe +
-- atendimentos VIP/skincare vinculados a cliente).
-- Rode este script INTEIRO no SQL Editor do Supabase (uma vez só).
-- ================================================================

alter table trainings add column if not exists type text not null default 'treinamento';

create table if not exists appointments (
  id bigint generated always as identity primary key,
  customer_id bigint references customers(id) on delete cascade,
  type text not null,
  appointment_date date not null,
  appointment_time time,
  notes text,
  status text not null default 'agendado',
  seller_id uuid references auth.users(id) default auth.uid(),
  created_at timestamptz default now()
);

alter table appointments enable row level security;

drop policy if exists "appointments_select" on appointments;
drop policy if exists "appointments_insert_own" on appointments;
drop policy if exists "appointments_update_own" on appointments;
drop policy if exists "appointments_delete_own" on appointments;

create policy "appointments_select" on appointments for select using (auth.role() = 'authenticated');
create policy "appointments_insert_own" on appointments for insert with check (auth.uid() = seller_id);
create policy "appointments_update_own" on appointments for update using (auth.uid() = seller_id);
create policy "appointments_delete_own" on appointments for delete using (auth.uid() = seller_id);
