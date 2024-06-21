class MakeArraysForTrades < ActiveRecord::Migration[7.0]
  def change
    change_column :trades, :outgoing, 'varchar USING outgoing::character varying[]'
    change_column :trades, :incoming, 'varchar USING outgoing::character varying[]'
  end
end
