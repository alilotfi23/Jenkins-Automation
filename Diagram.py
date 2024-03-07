from diagrams import Cluster, Diagram, Node, Edge
from diagrams.onprem.iac  import Terraform
from diagrams.onprem.iac import Ansible
from diagrams.onprem.ci import Jenkins
from diagrams.onprem.compute import Server
from diagrams.custom import Custom

with Diagram("test", show=False):
    iac = Terraform("")
    with Cluster("install"):
        Ans = Ansible("")
        jen = Jenkins("")
        svc = Server("Vsphere")

    iac >>  Ans >> jen >> svc
