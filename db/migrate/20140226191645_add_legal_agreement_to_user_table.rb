class AddLegalAgreementToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :legal_agreement, :boolean, :null => false, :default => false
    add_column :users, :legal_agree_date, :datetime

    add_index :users, :legal_agreement
  end

end
