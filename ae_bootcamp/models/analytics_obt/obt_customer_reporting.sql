{{ config(
    schema='dwh_northwind',
    materialized='table'
) }}

with source as (
    select
        po.purchase_order_id,
        po.quantity,
        po.unit_cost,
        po.date_received,
        po.posted_to_inventory,
        po.inventory_id,
        po.supplier_id,
        po.created_by,
        po.submitted_date,
        po.creation_date,
        po.status_id,
        po.expected_date,
        po.shipping_fee,
        po.taxes,
        po.payment_date,
        po.payment_amount,
        po.payment_method,
        po.notes,
        po.approved_by,
        po.approved_date,
        po.submitted_by,
        e.employee_id,
        e.last_name as employee_unique_employee_id,
        e.company as employee_company,
        e.last_name as employee_last_name,
        e.first_name as employee_first_name,
        e.email_address as employee_email_address,
        e.job_title as employee_job_title,
        e.business_phone as employee_business_phone,
        e.home_phone as employee_home_phone,
        e.mobile_phone as employee_mobile_phone,
        e.fax_number as employee_fax_number,
        e.address as employee_address,
        e.city as employee_city,
        e.state_province as employee_state_province,
        e.zip_postal_code as employee_zip_postal_code,
        e.country_region as employee_country_region,
        e.web_page as employee_web_page,
        e.notes as employee_notes,
        e.attachments as employee_attachments,
        current_timestamp() as insertion_timestamp
    from {{ ref('fact_purchase_order') }} po
    left join {{ ref('dim_employees') }} e 
    on e.employee_id = po.created_by
)

select * from source