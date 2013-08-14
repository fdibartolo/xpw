migration 4, :add_activation_date_to_job_offers do
  up do
    modify_table :job_offers do
      add_column :activation_date, Date
    end
  end

  down do
    modify_table :job_offers do
      drop_column :activation_date
    end
  end
end
