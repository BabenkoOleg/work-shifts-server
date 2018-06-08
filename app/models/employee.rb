# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("employee")
#  sign_in_count          :integer          default(0), not null
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  business_id            :integer
#  position_id            :integer
#
# Indexes
#
#  index_users_on_email_and_business_id  (email,business_id) UNIQUE
#  index_users_on_reset_password_token   (reset_password_token) UNIQUE
#

class Employee < User
  # === relations ===
  has_and_belongs_to_many :allowed_facilities,
                          class_name: 'Facility',
                          foreign_key: :employee_id,
                          join_table: :employees_facilities

  # === validations ===
  validate do
    unless position.kind_of? EmployeePosition
      errors.add(:position, 'the employee can have a position only for the employee')
    end
  end
end
