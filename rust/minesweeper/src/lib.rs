
pub fn annotate(minefield: &[&str]) -> Vec<String> {

    let board: Vec<&[u8]> = minefield.iter()
        .map(|x| x.as_bytes())
        .collect();

    board.iter()
        .enumerate()
        .map(|(i, row)| 
             row
             .iter()
             .enumerate()
             .map(|(j, b)| match b {
                 42 => String::from('*'),
                 _ => count_mines_by([i, j], &board),
             })
             .collect::<Vec<String>>().join("")
        ).collect()
    
}

fn count_mines_by(point: [usize; 2], board: &Vec<&[u8]>) -> String {

    let dims: [usize; 2] = [board.len(), board[0].len()];
    let mine_count: usize = get_nbs(&point, &dims)
        .iter()
        .map(|nb| is_mine(*nb, board))
        .sum();

    match mine_count {
        0 => String::from(" "),
        _ => mine_count.to_string(),
    }
    
    
}

fn get_nbs(p: &[usize; 2], dims: &[usize; 2]) -> Vec<[usize; 2]> {
 
    let nbs = vec![[-1, -1], [-1, 0], [0, -1], [-1, 1], [1, 1],
                   [1, 0], [0, 1], [1, -1]];
    nbs.into_iter()
        .map(|v| vec![v[0] + (p[0] as i32), v[1] + (p[1] as i32)])
        .filter(|v| (v[0] >= 0) & (v[0] < (dims[0] as i32)) 
                & (v[1] >= 0) & (v[1] < (dims[1] as i32)))
        .map(|v| [v[0] as usize, v[1] as usize])
        .collect::<Vec<_>>()
                      
}
 
fn is_mine(nb: [usize; 2], board: &Vec<&[u8]>) -> usize {

    let board_val: u8 = board[nb[0]][ nb[1]];
     match board_val {
         42 => 1,
         _ => 0,
     }
     
}

