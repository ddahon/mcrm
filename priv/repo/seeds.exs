# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mcrm.Repo.insert!(%Mcrm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mcrm.Repo
alias Mcrm.Contacts.Company
alias Mcrm.Contacts.ContactInfo

# Create companies
company1 = Repo.insert!(%Company{
  name: "TechFlow Solutions",
  city: "Paris",
  region: "Île-de-France",
  website: "https://techflow-solutions.com",
  linkedin: "https://linkedin.com/company/techflow-solutions",
  email: "contact@techflow-solutions.com",
  tel: "+33 1 42 86 75 30",
  sector: "Technology"
})

company2 = Repo.insert!(%Company{
  name: "GreenEnergy Dynamics",
  city: "Lyon",
  region: "Auvergne-Rhône-Alpes",
  website: "https://greenenergy-dynamics.fr",
  linkedin: "https://linkedin.com/company/greenenergy-dynamics",
  email: "info@greenenergy-dynamics.fr",
  tel: "+33 4 78 92 15 44",
  sector: "Renewable Energy"
})

# Create contacts for company1 (TechFlow Solutions)
Repo.insert!(%ContactInfo{
  role: "CEO",
  first_name: "Marie",
  last_name: "Dubois",
  city: "Paris",
  region: "Île-de-France",
  tel: "+33 6 12 34 56 78",
  email: "marie.dubois@techflow-solutions.com",
  notes: "Very interested in AI solutions. Prefers morning meetings.",
  linkedin: "https://linkedin.com/in/marie-dubois-ceo",
  last_contact_date: ~D[2025-08-05],
  status: "active",
  company_id: company1.id
})

Repo.insert!(%ContactInfo{
  role: "CTO",
  first_name: "Pierre",
  last_name: "Martin",
  city: "Paris",
  region: "Île-de-France",
  tel: "+33 6 98 76 54 32",
  email: "pierre.martin@techflow-solutions.com",
  notes: "Technical decision maker. Focused on scalability and performance.",
  linkedin: "https://linkedin.com/in/pierre-martin-cto",
  last_contact_date: ~D[2025-07-28],
  status: "active",
  company_id: company1.id
})

Repo.insert!(%ContactInfo{
  role: "Sales Director",
  first_name: "Sophie",
  last_name: "Leroy",
  city: "Paris",
  region: "Île-de-France",
  tel: "+33 6 45 67 89 01",
  email: "sophie.leroy@techflow-solutions.com",
  notes: "Handles enterprise accounts. Available for demos on Tuesdays and Thursdays.",
  linkedin: "https://linkedin.com/in/sophie-leroy-sales",
  last_contact_date: ~D[2025-08-10],
  status: "prospect",
  company_id: company1.id
})

Repo.insert!(%ContactInfo{
  role: "Product Manager",
  first_name: "Lucas",
  last_name: "Moreau",
  city: "Boulogne-Billancourt",
  region: "Île-de-France",
  tel: "+33 6 23 45 67 89",
  email: "lucas.moreau@techflow-solutions.com",
  notes: "Product roadmap discussions. Interested in user experience improvements.",
  linkedin: "https://linkedin.com/in/lucas-moreau-pm",
  last_contact_date: ~D[2025-07-15],
  status: "active",
  company_id: company1.id
})

Repo.insert!(%ContactInfo{
  role: "HR Manager",
  first_name: "Camille",
  last_name: "Rousseau",
  city: "Paris",
  region: "Île-de-France",
  tel: "+33 6 78 90 12 34",
  email: "camille.rousseau@techflow-solutions.com",
  notes: "Recruitment partnerships. Looking for training programs for technical staff.",
  linkedin: "https://linkedin.com/in/camille-rousseau-hr",
  last_contact_date: ~D[2025-08-01],
  status: "inactive",
  company_id: company1.id
})

# Create contacts for company2 (GreenEnergy Dynamics)
Repo.insert!(%ContactInfo{
  role: "Founder & CEO",
  first_name: "Antoine",
  last_name: "Bernard",
  city: "Lyon",
  region: "Auvergne-Rhône-Alpes",
  tel: "+33 6 11 22 33 44",
  email: "antoine.bernard@greenenergy-dynamics.fr",
  notes: "Passionate about sustainable technology. Prefers video calls.",
  linkedin: "https://linkedin.com/in/antoine-bernard-founder",
  last_contact_date: ~D[2025-08-08],
  status: "active",
  company_id: company2.id
})

Repo.insert!(%ContactInfo{
  role: "Operations Director",
  first_name: "Élise",
  last_name: "Girard",
  city: "Lyon",
  region: "Auvergne-Rhône-Alpes",
  tel: "+33 6 55 66 77 88",
  email: "elise.girard@greenenergy-dynamics.fr",
  notes: "Manages day-to-day operations. Expert in supply chain optimization.",
  linkedin: "https://linkedin.com/in/elise-girard-ops",
  last_contact_date: ~D[2025-07-25],
  status: "active",
  company_id: company2.id
})

Repo.insert!(%ContactInfo{
  role: "Business Development",
  first_name: "Julien",
  last_name: "Petit",
  city: "Villeurbanne",
  region: "Auvergne-Rhône-Alpes",
  tel: "+33 6 33 44 55 66",
  email: "julien.petit@greenenergy-dynamics.fr",
  notes: "Focuses on partnerships with municipalities. Available for site visits.",
  linkedin: "https://linkedin.com/in/julien-petit-bizdev",
  last_contact_date: ~D[2025-08-03],
  status: "prospect",
  company_id: company2.id
})

Repo.insert!(%ContactInfo{
  role: "Engineering Manager",
  first_name: "Nathalie",
  last_name: "Roux",
  city: "Lyon",
  region: "Auvergne-Rhône-Alpes",
  tel: "+33 6 77 88 99 00",
  email: "nathalie.roux@greenenergy-dynamics.fr",
  notes: "Leads technical team. Interested in innovative renewable technologies.",
  linkedin: "https://linkedin.com/in/nathalie-roux-engineering",
  last_contact_date: ~D[2025-07-20],
  status: "active",
  company_id: company2.id
})

Repo.insert!(%ContactInfo{
  role: "Finance Director",
  first_name: "Maxime",
  last_name: "Blanc",
  city: "Lyon",
  region: "Auvergne-Rhône-Alpes",
  tel: "+33 6 99 00 11 22",
  email: "maxime.blanc@greenenergy-dynamics.fr",
  notes: "Handles investment decisions and financial planning. Prefers formal presentations.",
  linkedin: "https://linkedin.com/in/maxime-blanc-finance",
  last_contact_date: ~D[2025-07-30],
  status: "inactive",
  company_id: company2.id
})

IO.puts "Created #{Repo.aggregate(Company, :count)} companies and #{Repo.aggregate(ContactInfo, :count)} contacts"
