package pkg;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/json/service")
public class JSONService {
	@GET
	@Path("/get")
	@Produces("application/json")
	public Product getApplication() {
		Product pr=new Product();
		pr.setName("Ipod");
		pr.setId(1);
		return pr;
	}

	@POST
	@Path("/post")
	@Consumes("application/json")
	public Product postApplication() {
		Product pr=new Product();
		pr.setName("Ipod");
		pr.setId(1);
		return pr;
	}
}
