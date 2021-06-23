import React from "react";

export function AddPlanet({ addPlanet }) {
  return (
    <div>
      <h4>Add A New Planet That you discoverd</h4>
      <form
        onSubmit={(event) => {
          // This function just calls the transferTokens callback with the
          // form's data.
          event.preventDefault();

          const formData = new FormData(event.target);
          const planet = formData.get("planet");
          const founder = formData.get("founder");

          if (planet && founder) {
            addPlanet(planet, founder);
          }
        }}
      >
        <div className="form-group">
          <label>founder </label>
          <input
            className="form-control"
            type="text"
            step="1"
            name="founder"
            placeholder="Ilamini Dagogo"
            required
          />
        </div>
        <div className="form-group">
          <label>Planet</label>
          <input className="form-control" type="text" name="planet" required placeholder="Bayelsa Planet" />
        </div>
        <div className="form-group">
          <input className="btn btn-primary" type="submit" value="Add Planet" />
        </div>
      </form>
    </div>
  );
}
